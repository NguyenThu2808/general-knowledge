context "when ..." do
end

describe ".class_method" do
end

describe "#instance_method" do
end

(Bad)
it 'creates a resource' do
  response.should respond_with_content_type(:json)
end

(Good)
it 'creates a resource' do
  expect(response).to respond_with_content_type(:json)
end

is_expected.to
