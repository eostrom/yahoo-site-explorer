Spec::Matchers.define :be_serialized_as do |string|
  match do |query|
    str2hash(query) == str2hash(string)
  end
  
  def str2hash(str)
    hash = {}
    str.split('&').each do |param|
      key,value = param.split('=')
      hash[key] = value
    end
    return hash
  end
end