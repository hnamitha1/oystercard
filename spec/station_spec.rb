require 'station'

describe Station do
   subject(:station) {described_class.new(name: "oldstreet",zone: 3)} 
   
   it "expects name to equal oldstreet" do
       expect(station.name).to eq("oldstreet")
   end    

   it "expects zone to eq 3" do
       expect(station.zone).to eq(3)
   end	

end
