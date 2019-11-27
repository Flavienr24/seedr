class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    # afficher le profile de user ( nom city email avatar)
    @user = current_user
    # afficher l'index des graines de user (image, titre, )
    @myseeds = Seedpack.where(user: current_user)
    # inclure lien pour delete et lien pour modifier chaque graine (fait dans view)

    # inclure lien pour poster une graine (fait dans view)

    # afficher l'historique des ventes
    # @mysells = Order.where(seedpack: seedpack(current_user))

    # afficher l'historique des achats
    # @mybuys = Order.where( current_user)
  end
end
