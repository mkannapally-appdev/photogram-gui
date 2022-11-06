Rails.application.routes.draw do

  get("/" , {:controller => "users" , :action => "index"})

  get("/users" , {:controller => "users" , :action => "index"})

  get("/users/:username" ,{:controller => "users" , :action => "show"} )

  get("/insert_user" , {:controller => "users" , :action => "create"})

  get("/update_user/:username" , {:controller => "users" , :action => "update"})


  get("/photos" , {:controller => "photos" , :action => "index"})

  get("/photos/:photo_id" ,{:controller => "photos" , :action => "show"} )

  get("/delete_photo/:photo_id" , {:controller => "photos" , :action => "delete"})

  get("/insert_photo" , {:controller => "photos" , :action => "create"})

  get("/update_photo/:modify_id" , {:controller => "photos" , :action => "update"})

end
