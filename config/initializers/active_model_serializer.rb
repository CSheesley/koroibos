# Enables Root key as the default when using serializers
# To disable for a specific Serializer:
# add `adapter: :attributes` after specifying serializer in controller
ActiveModelSerializers.config.adapter = :json
