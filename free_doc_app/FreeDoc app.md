### **1. FreeDoc app**



// Db diagram :



**Table doctor {**

  **id integer \[primary key]**

  **first\_name string**

  **last\_name string**

  **specialty string**

  **zip\_code string**

**}**



**Table patient {**

  **id integer \[primary key]**

  **first\_name string**

  **last\_name string**

**}**



**Table appointment {**

  **id integer \[primary key]**

  **date datetime**

  **doctor\_id integer**

  **patient\_id integer** 

**}**



**Ref: appointment.doctor\_id > doctor.id**

**Ref: appointment.patient\_id > patient.id**



// Defined relation between doctor \& patient with

// Join Table appointment

// Doctor has many patients, through appointment

// Patient has many doctors, through appointment

// Doctor has many appointments, appointment belongs to doctor

// Patient has many appointments, appointment belongs to patient



