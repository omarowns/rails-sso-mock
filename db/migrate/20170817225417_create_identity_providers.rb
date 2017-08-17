class CreateIdentityProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :identity_providers do |t|
      t.string :name
      t.string :idp_entity_id
      t.string :idp_sso_target_url
      t.string :idp_slo_target_url
      t.text :idp_cert
      t.string :idp_cert_fingerprint
      t.string :idp_cert_fingerprint_algorithm

      t.timestamps
    end
  end
end
