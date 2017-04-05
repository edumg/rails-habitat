Dashing.scheduler.every '1s' do
  Dashing.send_event('num_listings', { value: 123123123 })

  url = "http://mywebaddressgoeshere"
  puts url
  Dashing.send_event('log', value: url)
end
