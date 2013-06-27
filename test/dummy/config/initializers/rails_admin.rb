RailsAdmin.config do |config|
  config.current_user_method { } # auto-generated

  # Use CanCan for authorization
  config.authenticate_with {}

  config.actions do
    # root actions
    dashboard                     # mandatory
                                  # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
                                  # member actions
    show
    edit
    delete
    history_show
    show_in_app
    data_quality_view
    #quality do
    # Make it visible only for company model. You can remove this if you don't need.
    #visible do
    #bindings[:abstract_model].model.to_s == "Company"
    #end
    #end
  end


end
