Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "homepage" })  

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Investor resource:

  # CREATE
  post("/insert_investor", { :controller => "investors", :action => "create" })
          
  # READ
  get("/investors", { :controller => "investors", :action => "index" })
  
  get("/investors/:path_id", { :controller => "investors", :action => "show" })
  
  # UPDATE
  
  post("/modify_investor/:path_id", { :controller => "investors", :action => "update" })
  
  # DELETE
  get("/delete_investor/:path_id", { :controller => "investors", :action => "destroy" })

  #------------------------------

  # Routes for the Entrepreneur resource:

  # CREATE
  post("/insert_entrepreneur", { :controller => "entrepreneurs", :action => "create" })
          
  # READ
  get("/entrepreneurs", { :controller => "entrepreneurs", :action => "index" })
  
  get("/entrepreneurs/:path_id", { :controller => "entrepreneurs", :action => "show" })
  
  # UPDATE
  
  post("/modify_entrepreneur/:path_id", { :controller => "entrepreneurs", :action => "update" })
  
  # DELETE
  get("/delete_entrepreneur/:path_id", { :controller => "entrepreneurs", :action => "destroy" })

  #------------------------------

  # Routes for the Transaction resource:

  # CREATE
  post("/insert_transaction", { :controller => "transactions", :action => "create" })
          
  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  
  get("/transactions/:path_id", { :controller => "transactions", :action => "show" })
  
  # UPDATE
  
  post("/modify_transaction/:path_id", { :controller => "transactions", :action => "update" })
  
  # DELETE
  get("/delete_transaction/:path_id", { :controller => "transactions", :action => "destroy" })

  #------------------------------

end
