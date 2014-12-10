# class OrderWorker
#     include Sidekiq::Worker
#
#     def perform(order_id)
#       if order = Order.find_by(id: order_id)
#         Rails.logger.info "Processing order #{order_id}"
#       else
#         Rails.logger.error "Could not find order with order ID = #{order_id}"
#       end
#     end
# end
