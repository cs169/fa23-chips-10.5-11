require 'rails_helper'

RSpec.describe MyEventsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Event', county_id: 1, description: 'Description', start_time: Time.now, end_time: Time.now + 1.hour }
  }

  let(:invalid_attributes) {
    { name: nil, county_id: nil, description: nil, start_time: nil, end_time: nil }
  }

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {event: valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created event" do
        post :create, params: {event: valid_attributes}
        expect(response).to redirect_to(Event.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Event" do
        expect {
          post :create, params: {event: invalid_attributes}
        }.to change(Event, :count).by(0)
      end

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {event: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :edit, params: {id: event.to_param}
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Updated Event', county_id: 2, description: 'Updated Description', start_time: Time.now, end_time: Time.now + 2.hours }
      }

      it "updates the requested event" do
        event = Event.create! valid_attributes
        put :update, params: {id: event.to_param, event: new_attributes}
        event.reload
        expect(event.name).to eq('Updated Event')
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, params: {id: event.to_param, event: new_attributes}
        event.reload
        expect(response).to redirect_to(event)
      end
    end

    context "with invalid params" do
      it "does not update the event" do
        event = Event.create! valid_attributes
        put :update, params: {id: event.to_param, event: invalid_attributes}
        event.reload
        expect(event.name).to eq('Event')
      end

      it "returns a success response (i.e. to display the 'edit' template)" do
        event = Event.create! valid_attributes
        put :update, params: {id: event.to_param, event: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, params: {id: event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, params: {id: event.to_param}
      expect(response).to redirect_to(events_url)
    end
  end
end```
