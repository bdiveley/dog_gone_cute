require "rails_helper"

describe "POST requests for Dogs" do
  it "POST /api/v1/dogs if dog does not yet exist" do
    breed = create(:breed, name: "deerhound-scottish")
    params = { photo: "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg",
      score: 3
    }

    post "/api/v1/dogs", params: params

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(Breed.count).to eq(1)
    expect(Dog.last.photo).to eq("https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg")
    expect(Dog.last.votes).to eq(1)
    expect(Dog.last.total_score).to eq(3)
    expect(parsed[:data][:attributes]).to have_key(:id)
    expect(parsed[:data][:attributes]).to have_key(:breed_id)
    expect(parsed[:data][:attributes]).to have_key(:photo)
    expect(parsed[:data][:attributes]).to have_key(:ave_score)
    expect(parsed[:data][:attributes][:ave_score]).to eq(3.0)
  end
  it "POST /api/v1/dogs if dog already exists" do
    breed = create(:breed, name: "deerhound-scottish")
    dog = create(:dog, photo: "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", breed_id: breed.id, votes: 5, total_score: 20)
    params = { photo: "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg",
      score: 1
    }

    post "/api/v1/dogs", params: params

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(Breed.count).to eq(1)
    expect(Dog.count).to eq(1)
    expect(Dog.last.votes).to eq(6)
    expect(Dog.last.total_score).to eq(21)
    expect(parsed[:data][:attributes]).to have_key(:id)
    expect(parsed[:data][:attributes]).to have_key(:breed_id)
    expect(parsed[:data][:attributes]).to have_key(:photo)
    expect(parsed[:data][:attributes]).to have_key(:ave_score)
    expect(parsed[:data][:attributes][:ave_score]).to eq(3.5)
  end
end
