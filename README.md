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
 

----------------------------------------------------------------------------------------------------------------------------------
                                              DICTIONARY/SHORTHAND
----------------------------------------------------------------------------------------------------------------------------------
---Category table, @@core{} short hand---
abdom: = "Abdominal"
gas: = "Gastrointestinal Surgery"
head: = "Head/Neck Surgery"
mis: = "Minimally Invasive Surgery"
neuro: = "Neurologic Surgery "
ortho: = "Orthopedic Surgery"
skin: = "Skin/Reconstructive Surgery"
thor: = "Thoracic Surgery "
uro: = "Urogenital"
