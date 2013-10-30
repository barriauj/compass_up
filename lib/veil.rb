require 'open3'

class Veil 

  attr_accessor :gpg_bin, :gpg_home, :gpg_command

  def initialize(options = {})
    @gpg_bin          = `which gpg`.chomp! 
    @gpg_home         = options[:gpg_home] ||= "#{ENV['HOME']}/.gnupg"
    @gpg_command      = "#{gpg_bin} --homedir #{gpg_home} --no-tty --batch --no-verbose --yes --always-trust --no-comments -a"

    raise "No GPG binary was found in your PATH." unless /\/gpg/.match(gpg_bin)
    raise "GPG Home '#{gpg_home}' does not exit." unless File.exists?(gpg_home)
  end

  def encrypt(options = {}) 
    from_file         = options[:from_file]
    to_file           = options[:to_file]
    from_stdin        = options[:from_stdin]
    to_stdout         = options[:to_stdout]
    recipients        = options[:recipients].join(" -r ")

    if to_file
      command         = "#{gpg_command} -o #{to_file} -r #{recipients}"
      output_method   = "file"
    elsif to_stdout
      command         = "#{gpg_command} -o - -r #{recipients}"
      output_method   = "stdout"
    end

    if from_file
      command.insert(-1, " -e #{from_file}")
    elsif from_stdin
      command.insert(0, "echo '#{from_stdin}'|")
      command.insert(-1, " -e")
    end

    stdin, stdout, stderr = Open3.popen3(command)
    output = stdout.read.chomp!
    stdout.close
    exit_code = $?

    process_output(exit_code, output, output_method)
  end
  
  def decrypt(options = {})
    from_file         = options[:from_file]
    to_file           = options[:to_file]
    from_stdin        = options[:from_stdin]
    to_stdout         = options[:to_stdout]
    passphrase        = options[:passphrase]

    if to_file
      command = "#{gpg_command} --passphrase #{passphrase} -o #{to_file} -d"
      output_method   = "file"
    elsif to_stdout
      command = "#{gpg_command} --passphrase #{passphrase} -d"
      output_method   = "stdout"
    end

    if from_file
      command.insert(-1, " #{from_file}")
    elsif from_stdin
      command.insert(0, "echo '#{from_stdin}'|")
    end

    stdin, stdout, stderr = Open3.popen3(command)
    output = stdout.read.chomp!
    stdout.close
    exit_code = $?

    process_output(exit_code, output, output_method)
  end
 
  private

  def process_output(exit_code, output, output_method)
    if exit_code == 0
      success = true
    else
      success = false
    end

    if success && output_method == "stdout" 
      output
    elsif success && output_method == "file" 
      "success"
    else
      "failure"
    end
  end
end