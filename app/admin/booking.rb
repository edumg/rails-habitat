ActiveAdmin.register Booking do

permit_params :start_date, :end_date, :num_guests, :rent_cost, :listing, :location

end
