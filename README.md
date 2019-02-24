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

**GET /api/v1/dogs?order=desc**

**Response (Success)**
```shell
{:data=>
  [{:id=>"603",
    :type=>"dog",
    :attributes=>{:id=>603, :breed_id=>641, :photo=>"https://images.dog.ceo/breeds/beagle/n02092002_14567.jpg", :ave_score=>87.0}},
   {:id=>"601",
    :type=>"dog",
    :attributes=>{:id=>601, :breed_id=>639, :photo=>"https://images.dog.ceo/breeds/chow/n02092002_14567.jpg", :ave_score=>30.0}},
   {:id=>"600",
    :type=>"dog",
    :attributes=>{:id=>600, :breed_id=>638, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>9.11111111111111}},
   {:id=>"599",
    :type=>"dog",
    :attributes=>{:id=>599, :breed_id=>637, :photo=>"https://images.dog.ceo/breeds/bouvier/n02092002_14567.jpg", :ave_score=>6.58333333333333}},
   {:id=>"602",
    :type=>"dog",
    :attributes=>{:id=>602, :breed_id=>640, :photo=>"https://images.dog.ceo/breeds/affenpinscher/n02092002_14567.jpg", :ave_score=>2.1875}}
  ]
}
```

**GET /api/v1/dogs?order=asc**

**Response (Success)**
```shell
{:data=>
  [{:id=>"588",
    :type=>"dog",
    :attributes=>{:id=>588, :breed_id=>626, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>0.611111111111111}},
   {:id=>"587",
    :type=>"dog",
    :attributes=>{:id=>587, :breed_id=>625, :photo=>"https://images.dog.ceo/breeds/chow/n02092002_14567.jpg", :ave_score=>0.642857142857143}},
   {:id=>"590",
    :type=>"dog",
    :attributes=>{:id=>590, :breed_id=>628, :photo=>"https://images.dog.ceo/breeds/beagle/n02092002_14567.jpg", :ave_score=>2.54545454545455}},
   {:id=>"586",
    :type=>"dog",
    :attributes=>{:id=>586, :breed_id=>624, :photo=>"https://images.dog.ceo/breeds/bouvier/n02092002_14567.jpg", :ave_score=>3.06666666666667}},
   {:id=>"589",
    :type=>"dog",
    :attributes=>{:id=>589, :breed_id=>627, :photo=>"https://images.dog.ceo/breeds/affenpinscher/n02092002_14567.jpg", :ave_score=>5.57142857142857}}
  ]
}
```

**GET /api/v1/dogs/search?breed=chow&order=desc**

**Response (Success)**
```shell
{:data=>
  [{:id=>"1080",
    :type=>"dog",
    :attributes=>{:id=>1080, :breed_id=>1081, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>4.46666666666667}},
   {:id=>"1079",
    :type=>"dog",
    :attributes=>{:id=>1079, :breed_id=>1081, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>1.0}}
  ]
}
```

**GET /api/v1/dogs/search?breed=chow&order=asc**

**Response (Success)**
```shell
{:data=>
  [{:id=>"1085",
    :type=>"dog",
    :attributes=>{:id=>1085, :breed_id=>1085, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>3.5}},
   {:id=>"1084",
    :type=>"dog",
    :attributes=>
     {:id=>1084, :breed_id=>1085, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>4.677}}
  ]
}
```

**POST /api/v1/dogs**
```shell
Body: { photo: "https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg",
  score: 3
}
```

**Response (Success)**
```shell
{:data=>
  {:id=>"1573",
   :type=>"dog",
   :attributes=>{:id=>1573, :breed_id=>1525, :photo=>"https://images.dog.ceo/breeds/deerhound-scottish/n02092002_14567.jpg", :ave_score=>3.0}
 }
}
```
