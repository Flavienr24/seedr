class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @disable_nav = true
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
    # @order = current_user.orders.where(state: 'pending').find(params[:order_id])
     @mybuys = Order.where(user: current_user)
  end
end
