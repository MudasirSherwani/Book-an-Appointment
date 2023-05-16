require 'swagger_helper'

RSpec.describe 'doctors', type: :request do
  path '/doctors/create' do
    post 'Create a doctor' do
      tags 'api/doctors'
      consumes 'application/json', 'application/xml'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          city: { type: :string },
          image: { type: :string },
          description: { type: :string },
          speciality: { type: :string }
        },
        required: %w[name city image description speciality]
      }

      response '201', 'doctor created' do
        let(:doctor) do
          { name: 'Dr.Ahmed', city: 'NYC', image: 'imagesdoctorsdoctor-1.jpg', description: 'RBSP',
            speciality: 'Dentist' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'Dr.Ahmed' } }
        run_test!
      end
    end
  end

  path '/doctors' do
    get('list doctors') do
      tags 'api/doctors'
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

  path '/doctors/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show doctor') do
      tags 'api/doctors'
      response(200, 'successful') do
        let(:id) { '1' }

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

    delete('delete doctor') do
      tags 'api/doctors'
      response(200, 'successful') do
        let(:id) { '1' }

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
end
