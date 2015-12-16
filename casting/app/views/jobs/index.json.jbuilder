json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :payment, :start_date, :end_date, :user_id
  json.url job_url(job, format: :json)
end
