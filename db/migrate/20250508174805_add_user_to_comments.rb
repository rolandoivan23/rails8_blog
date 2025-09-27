# db/migrate/20250508174805_add_user_to_comments.rb
class AddUserToComments < ActiveRecord::Migration[7.1]
  def up
    # Paso 1: Añadir la columna permitiendo nulos temporalmente
    add_reference :comments, :user, foreign_key: true, null: true

    # Paso 2: Asignar un usuario por defecto a los comentarios existentes
    # Asegúrate de que el usuario con ID 1 exista, o elige otro ID válido.
    first_user_id = User.first.id
    Comment.where(user_id: nil).update_all(user_id: first_user_id)

    # Paso 3: Ahora sí, hacer que la columna no acepte nulos
    change_column_null :comments, :user_id, false
  end

  def down
    remove_reference :comments, :user
  end
end
