class AddRequestorToIdentityProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :identity_providers, :requestor, :string
  end
end
