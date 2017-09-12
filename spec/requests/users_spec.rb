require 'rails_helper'

RSpec.describe 'Users API', type: :request do

    let!(:users) { create_list(:user, 10) }
    let(:user_id) { users.first.id }

    describe 'GET /users' do
        before { get '/users' }

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'returns users' do
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

    end

    describe 'GET /users/:id' do
        before { get "/users/#{user_id}" }

        context 'when the record exists' do
            it 'returns the user' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(user_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the record does not exist' do
            let(:user_id) { 100 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find User/)
            end
        end
    end

    describe 'POST /users' do
        let(:valid_attributes) { { name: 'Michael', email: 'michael@gmail.com', dob: '20/01/1979' } }

        context 'when the request is valid' do
            before { post '/users', params: valid_attributes }

            it 'creates a User' do
                expect(json['name']).to eq('Michael')
            end

            it 'returns a status code of 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/users', params: { name: 'Foobar' } }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it ' returns a validation failure message' do
                expect(response.body)
                    .to match(/Validation failed: Email can't be blank/)
            end
        end
    end

    describe 'PUT /users/:id' do
        let(:valid_attributes) { { name: 'Michael', email: 'michael@gmail.com', dob: '20/01/1979' } }

        context 'when the record exists' do
            before { put "/users/#{user_id}", params: valid_attributes }

            it 'updates the record' do
                expect(response.body).to be_empty
            end

            it 'returns a status code of 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    describe 'DELETE /users/:id' do
        before { delete "/users/#{user_id}" }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end
