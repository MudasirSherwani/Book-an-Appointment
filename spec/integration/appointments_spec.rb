require 'swagger_helper'

RSpec.describe 'appointments', type: :request do
  path '/appointments/create' do
    post('create appointments') do
      tags 'api/appointments'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '{user_id}/appointments/' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list reservations') do
      tags 'api/appointments'
      response(200, 'successful') do
        let(:user_id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/doctors/{doctor_id}/apointments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'doctor_id', in: :path, type: :string, description: 'doctor_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show reservation') do
      tags 'api/appointments'
      response(200, 'successful') do
        let(:doctor_id) { '1' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

end