### **3. Gossip app**



// Db diagram :



**Table user {**

  **id integer \[primary key]**

  **first\_name string**

  **last\_name string**

  **description text**

  **email string**

  **age integer**

  **city\_id integer \[ref: > city.id] //city has many users**

**}**

**// 10 users Faker**



**Table gossip {**

  **id integer \[primary key]**

  **title string**

  **content text**

  **user\_id integer \[ref: > user.id] // user has many gossips**

**}**

**// 20 gossips Faker**



**Table tag {**

  **id integer \[primary key]**

  **title string**

**}**

**// 10 tags Faker**



**Table city {**

  **id integer \[primary key]**

  **name string**

  **zip\_code string**

**}**

**// 10 cities Faker**



**Table join\_table\_gossip\_tag {**

  **id integer \[primary key]**

  **gossip\_id integer \[ref: > gossip.id]**

  **tag\_id integer \[ref: > tag.id]**

**}**

**// join table with ref to gossip and tag id**



**Table private\_message {**

  **id integer \[primary key]**

  **content text**

  **sender\_id integer \[ref: > user.id]**

  **recipient\_id integer \[ref: > user.id]**

**}**



**Table comment {**

  **id integer \[primary key]**

  **content text**

  **user\_id integer \[ref: > user.id]**

  **// polymorphism :**

  **commentable\_id integer  // ID of commented object (Gossip or Comment)**

  **commentable\_type string // Class name ("Gossip" "Comment")**

**}**

**// 20 comments Faker**



**Table like {**

  **id integer \[primary key]**

  **user\_id integer \[ref: > user.id]**

  **// polymorphism :**

  **likeable\_id integer  // ID of commented object (Gossip or Comment)**

  **likeable\_type string // Class name ("Gossip" "Comment")**

**}**

**// 20 likes Faker**



