require "rails_helper"

describe "POST requests for Dogs" do
  it "POST /api/v1/dogs" do
    breed = create(:breed, name: "deerhound-scottish")
    params = { photo: "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg",
      score: 3
    }

    post "/api/v1/dogs", params: params

    parsed = JSON.parse(response.body, symbolize_names: true)

    binding.pry
    expect(response).to be_successful
    expect(parsed[:data][:attributes]).to have_key(:id)
    expect(parsed[:data][:attributes]).to have_key(:breed_id)
    expect(parsed[:data][:attributes]).to have_key(:photo)
    expect(parsed[:data][:attributes]).to have_key(:ave_score)
    expect(parsed[:data][:attributes][:ave_score]).to eq(3.0)
  end
end
