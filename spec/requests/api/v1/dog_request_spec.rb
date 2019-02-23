require "rails_helper"

describe "Requests for Dogs" do
  it "GET /api/v1/dogs?order=desc" do
    dogs = create_list(:dog, 5)

    get "/api/v1/dogs?order=desc"

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].count).to eq(5)
    expect(parsed[:data][0][:attributes]).to have_key(:id)
    expect(parsed[:data][0][:attributes]).to have_key(:breed_id)
    expect(parsed[:data][0][:attributes]).to have_key(:photo)
    expect(parsed[:data][0][:attributes]).to have_key(:ave_score)
  end
  it "GET /api/v1/dogs?order=asc" do
    dogs = create_list(:dog, 5)

    get "/api/v1/dogs?order=asc"

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data]).to be_a(Array)
    expect(parsed[:data].count).to eq(5)
    expect(parsed[:data][0][:attributes]).to have_key(:id)
    expect(parsed[:data][0][:attributes]).to have_key(:breed_id)
    expect(parsed[:data][0][:attributes]).to have_key(:photo)
    expect(parsed[:data][0][:attributes]).to have_key(:ave_score)
  end
end
