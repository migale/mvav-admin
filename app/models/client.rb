class Client < ActiveRecord::Base
  attr_accessible :adresse1, :adresse2, :client_facture, :email, :nom, :nom_facturation, :password, :pk_client
end
