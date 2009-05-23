require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Yahoo::SE::Inlinks do
  before do
    @result1 = mock(Yahoo::SE::Result)
    @response = mock(Yahoo::SE::Response, :total_results_available => 120)
    @request = mock(Yahoo::SE::Request, :results => [@result1], :response => @response, :next => [@result1])
  end
  
  describe "Class" do
    it "should list all of the results for a given page request" do
      Yahoo::SE.application_id = "123"
      inlinks = Yahoo::SE.inlinks("http://erbmicha.com")
      all_inlinks = inlinks.collect
      all_inlinks.length.should > 0
    end
  end
  
  it "should have the service path for the inlinks service" do
    Yahoo::SE::Inlinks::SERVICE_PATH.should == "http://search.yahooapis.com/SiteExplorerService/V1/inlinkData"
  end
  
  it "should return 100 inlink results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>100, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    Yahoo::SE.inlinks("http://rubyskills.com", :results => 100).results
  end
  
  it "should return the next 75 inlink results" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>75, :query=>"http://rubyskills.com", :start => 1}).and_return(@request)
    inlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 75)
    inlinks.results
    Yahoo::SE::Request.should_receive(:new).with("http://search.yahooapis.com/SiteExplorerService/V1/inlinkData", {:results=>44, :query=>"http://rubyskills.com", :start => 76}).and_return(@request)
    inlinks.next.should == [@result1]
  end
  
  it "should yield many result pages" do
    Yahoo::SE.application_id = "123"
    Yahoo::SE::Request.should_receive(:new).twice.and_return(@request)
    inlinks = Yahoo::SE.inlinks("http://rubyskills.com", :results => 110)
    iterations = 0;
    inlinks.each{iterations+=1}
    iterations.should == 2
  end
end