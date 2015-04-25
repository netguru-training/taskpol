module ApplicationHelper
  def message_type_to_bootstrap_class flash_type
    { error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
end
