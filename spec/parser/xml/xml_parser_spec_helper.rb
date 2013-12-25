def sample_file_stream(sample)
  File.open(File.join(sample_dir, sample))
end

def sample_dir
  File.join(File.dirname(__FILE__), 'sample')
end
