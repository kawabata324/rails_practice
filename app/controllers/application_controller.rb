class ApplicationController < ActionController::Base

  include SessionsHelper

  def hello
    render html: "¡Hola, mundo!"
  end

  def goodbye
    render html: "goodbye, world!"
  end
end
