class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    # afficher le profile de user ( nom city email avatar)
    @user = current_user
    # afficher l'index des graines de user (image, titre, )
    @myseeds = @user.seedpacks
    # inclure lien pour delete et lien pour modifier chaque graine (fait dans view)

    # inclure lien pour poster une graine (fait dans view)

    # afficher l'historique des ventes
    @mysells = Order.where(seedpack_id: @myseeds.ids)
    # afficher l'historique des achats
    # @order = current_user.orders.where(state: 'pending').find(params[:order_id])
     @mybuys = @user.orders
  end
end
