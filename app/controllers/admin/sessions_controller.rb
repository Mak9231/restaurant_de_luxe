
# class Admin::SessionsController < ApplicationController
#   # layout "admin" # On peut créer un layout spécial ou garder l'existant

#   def new
#   end

#   def create
#     if params[:username] == "admin" && params[:password] == "secret"
#       session[:admin] = true
#       redirect_to admin_reservations_path, notice: "Connexion réussie."
#     else
#       flash.now[:alert] = "Identifiants invalides"
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     session[:admin] = nil
#     redirect_to admin_login_path, notice: "Déconnecté avec succès."
#   end
# end



# class Admin::SessionsController < ApplicationController
#   # layout "admin"

#   def new
#   end

#   def create
#     admin = AdminUser.find_by(email: params[:email])

#     if admin&.authenticate(params[:password])
#       session[:admin_user_id] = admin.id
#       redirect_to admin_reservations_path, notice: "Connexion réussie"
#     else
#       flash.now[:alert] = "Email ou mot de passe incorrect"
#       render :new
#     end
#   end

#   def destroy
#     session[:admin_user_id] = nil
#     redirect_to root_path, notice: "Déconnecté"
#   end
# end




class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    admin = AdminUser.find_by(email: params[:email])
    if admin&.authenticate(params[:password])
      session[:admin] = true
      redirect_to admin_reservations_path, notice: "Connexion réussie"
    else
      flash.now[:alert] = "Email ou mot de passe incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path, notice: "Déconnecté avec succès"
  end
end



class Admin::SessionsController < ApplicationController
  layout "admin" # Optionnel, si tu veux un layout différent

  def new
    # Juste pour afficher le formulaire
  end

  def create
    admin = AdminUser.find_by(email: params[:email])

    if admin&.authenticate(params[:password])
      session[:admin] = true
      redirect_to admin_reservations_path, notice: "Connecté avec succès"
    else
      flash.now[:alert] = "Identifiants incorrects"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path, notice: "Déconnecté"
  end
end
