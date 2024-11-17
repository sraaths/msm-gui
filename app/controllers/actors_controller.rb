class ActorsController < ApplicationController
  def update
    # Get the ID out of params
    a_id = params.fetch("the_id")
    # Look up the existing record
    matching_records = Actor.where({ :id => a_id })
    the_actor = matching_records.at(0)
    # Overwrite each column with the values from user inputs
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.bio = params.fetch("the_bio")
    the_actor.image = params.fetch("the_image")
    # Save
    the_actor.save
    # Redirect to the movie details page
    redirect_to("/actors#{the_actor.id}")
  end

  def create
    # params hash looks like this:
    # {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}
    a = Actor.new
    a.name = params.fetch("the_name")
a.dob = params.fetch("the_dob")
a.bio = params.fetch("the_bio")
a.image = params.fetch("the_image")
a.save

    a.save
    redirect_to("/actors")
    # Retrieve the user's inputs from params
    # Create a record in the movie table
    # Populate each column with the user input
    # Save
    # Redirect the user back to the /movies URL
  end

 


  def destroy
    # Fetch the ID from params
    the_id = params.fetch("the_id")
     
    # Find the matching actor record(s)
    matching_records = Actor.where({ :id => the_id })
    the_actor = matching_records.at(0)
     
    # Delete the record if it exists
    the_actor.destroy if the_actor
     
    # Redirect to the actors index
    redirect_to("/actors")
  end
  
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
