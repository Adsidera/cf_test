# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ProductChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "product_channel"
  end

  def unsubscribed

  end

  def listen
    stop_all_streams #default method by ActionCable to stop all previous streams
    stream_for data["product_id"] #stream from channel specific to product 
  end

end
