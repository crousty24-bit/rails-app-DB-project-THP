### **2. walkMyDog app**



// Db diagram :



**Table dogsitter {**

  **id integer \[primary key]**

  **name string**

  **email string**

  **city\_id integer**

**}**



**Table dog {**

  **id integer \[primary key]**

  **name string**

  **race string**

  **age integer**

  **city\_id integer**

**}**



**Table stroll {**

  **id integer \[primary key]**

  **date datetime**

  **dogsitter\_id integer**

  **dog\_id integer**

**}**



**Table city {**

  **id integer \[primary key]**

  **city\_name string**

**}**



**Ref: stroll.dogsitter\_id > dogsitter.id**

**Ref: stroll.dog\_id > dog.id**

**Ref: dogsitter.city\_id > city.id**

**Ref: dog.city\_id > city.id**



