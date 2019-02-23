# README

1. Anyone who goes to the site sees the same thing.
2. Visitors can rate dog photos by cuteness (You may choose the scale)
3. They can then filter dog photos by cuteness level.
4. Dogs can also be filtered by dog breed

https://dog.ceo/api/breed/:breed/images/random (by breed)
https://dog.ceo/api/breeds/image/random (all breeds)
https://dog.ceo/api/breeds/list/all (lists all breeds)
https://dog.ceo/api/breed/:breed/images(returns array of images by breed)

**Database:**
Breeds - :id, :type
Dogs - :id, :breed_id, :photo, :votes, :score

Why not store all pictures in the database from the beginning?  
I want to use api so I can get to get pictures dynamically in case they add or change out their images.

*Upon page load, an api_call is made to **GET https://dog.ceo/api/breeds/list/all** from the backend which will display in the nav bar along with "Random" and "Cutest"

*When a user clicks on one of the dog breed names, a random get call is called to return a dog pic based on the breed selected. **GET https://dog.ceo/api/breed/:breed/images/random**

*When a random button is clicked, another random get call is made to return a new dog pic. **GET https://dog.ceo/api/breeds/image/random**

*No Dog starts in the database.
*When a user clicks on any picture and then rates the picture, a Create method is called to add that photo do the database (find_or_create).  **POST /api/v1/dogs**

**GET /api/v1/dogs**

**Response (Success)**
```shell
{:data=>
  [
  {:id=>"300",
    :type=>"dog",
    :attributes=>{:id=>300, :breed_id=>338, :photo=>"https://images.dog.ceo/breeds/chow/n02092002_14567.jpg", :ave_score=>16}},
   {:id=>"298",
    :type=>"dog",
    :attributes=>{:id=>298, :breed_id=>336, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>7}},
   {:id=>"297",
    :type=>"dog",
    :attributes=>{:id=>297, :breed_id=>335, :photo=>"https://images.dog.ceo/breeds/bouvier/n02092002_14567.jpg", :ave_score=>6}},
   {:id=>"299",
    :type=>"dog",
    :attributes=>{:id=>299, :breed_id=>337, :photo=>"https://images.dog.ceo/breeds/affenpinscher/n02092002_14567.jpg", :ave_score=>5}},
   {:id=>"293",
    :type=>"dog",
    :attributes=>{:id=>293, :breed_id=>331, :photo=>"https://images.dog.ceo/breeds/beagle/n02092002_14567.jpg", :ave_score=>2}}
  ]
}
```
