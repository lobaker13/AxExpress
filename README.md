#AxExpress is a program that generates a patient-safe anesthetic protocols for small animal veterinary medicine. By incorporating certain variables declared as "risks" in this program, a patients drug protocol may be adjusted appropriately based on whether a patient has an anesthetic risk or not.

Rails 5.1.2
---Let's get started!---

```
rails new ax_express

```

----------------------------------------------------------------------------------------------------------------------------------
                        GEM INSTALL
----------------------------------------------------------------------------------------------------------------------------------
---In the gem file, we will add the gems to be used---
```
gem 'devise'
gem 'simple_form'
gem 'attr_bitwise'
```

```
bundle install
rails generate simple_form:install
```
----------------------------------------------------------------------------------------------------------------------------------
                            DEVISE
----------------------------------------------------------------------------------------------------------------------------------     --Next we are going to set up devise--
```
rails generate devise:install
```

in config/environments/devolopments.rb paste the code generated in the terminal
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

--In your app.erb paste these alerts--
```
<p class="notice"><%= notice %></p>
<p class="alert"><%= alert %></p>
```
--Create a user model through Devise then migrate, default is Admin--
```
rails g devise User
rails db:migrate
```
--- NOTE:You should restart your application after changing Devise's configuration options. Otherwise, you will run into strange errors, for example, users being unable to login and route helpers being undefined.---      

---Add the packaged views from devise---
```
rails g devise:views
```
---Add the packaged controllers from devise---
```
rails g devise:controllers users
```
---reset registrations controller routes in ``routes.rb``---
```
devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
```

----------------------------------------------------------------------------------------------------------------------------------
                                                        SCAFFOLD
----------------------------------------------------------------------------------------------------------------------------------  

```
rails g scaffold category name:string core:integer procedure_id

rails g scaffold procedure name:string category_id:integer category:belongs_to

rails g scaffold breed name:string species:integer status:integer  

rails g scaffold patient fname:string lname:string dob:date sex:integer weight:decimal  breed:belongs_to user:belongs_to

rails g scaffold drug name:string commercial_name:string klass:string category:string concentration:decimal adverse:text route_of_admin:integer pronunciation:string  

rails g scaffold protocol weight:decimal age:integer asa:integer bsc:integer alert:text patient:belongs_to

rails g scaffold risk asa:integer temperament:string bcs:integer breed:string comorbidities:string age:integer heart_murmur:integer procedure:string history:boolean patient_procedure:belongs_to

rails g scaffold patient_procedure procedure:belongs_to patient:belongs_to

rails g scaffold protocol_drug dose:decimal additional_analgesic:integer drug:belongs_to protocol:belongs_to

rails g scaffold clinical_dose min:integer max:integer drug:belongs_to
 ```

----------------------------------------------------------------------------------------------------------------------------------
                                              DICTIONARY/SHORTHAND
----------------------------------------------------------------------------------------------------------------------------------
---Category table, @@cores{} short hand---
* abdom = "Abdominal"
* gas = "Gastrointestinal Surgery"
* head = "Head/Neck Surgery"
* mis = "Minimally Invasive Surgery"
* neuro = "Neurologic Surgery "
* ortho = "Orthopedic Surgery"
* skin = "Skin/Reconstructive Surgery"
* thor = "Thoracic Surgery "
* uro = "Urogenital"

---enum sexes for patients---
* mi "male intact"
* mn "male neutered"
* fi "female intact"
* fs "female spayed"

---Drug table, @@routes{} for "Route of Administration", short hand
* iv = "Intravenous"
* im = "Intramuscular"
* sc = "Subcutaneous"
* po = "Per os"
* inh = "Inhalational"

1 = iv (base)
2 = im (base)
3 = iv,im
4 = sc (base)
5 = iv,sc
6 = im,sc
7 = iv,im,sc
8 = po (base)
9 = iv,po
10 = im,po
11 = iv,im,po
12 = sc,po
13 = iv,sc,po
14 = im,sc,po
15 = iv,im,sc,po
16 = inh (base)
17-32 etc.
---Formulas/Variables---
mg = "milligrams"
kg = "kilograms"
ml = "milliliters"
Q = hepatic blood flow
f = fraction of free drug (not bound)
Cl_int = intrinsic capacity of the hepatocytes to metabolize a drug

Hepatic Clearance: Cl(h) = Q [(f x Cl_int)/(Q+ f x Cl_int)]

"concentration" (mg/ml) [CONSTANT] - drug amount (mg) per 1 ml of suspension

"clinical_dose" (mg/kg) [CONSTANT] - Industry standard (can be species specific)
  "min"(mg/kg) - lowest clinical_dose
  "max"(mg/kg) - highest clinical_dose


"dose"(mg/kg) = ([clinical_dose] * patients weight (kg))

"amount"(mg) = dose in mg

"volume" (ml) = (amount / concentration)

Ex: In rails c
```
Patient.first.dosing(Drug.find_by_id(1), true)
```
Will output: "1.53225 mg/kg" through the dosing helper in the Patient model
