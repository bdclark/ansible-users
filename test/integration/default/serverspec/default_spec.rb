require 'spec_helper'

describe group('users') do
  it { should exist }
end

describe group('developers') do
  it { should exist }
  it { should have_gid 777 }
end

describe user('user1') do
  it { should belong_to_primary_group 'user1' }
  it { should belong_to_group 'users' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbYmAVC3HwwWmLgGe7/YIVS1EHoBeG70jKl8tNY8GCswrrEVS1cEViYCAhCMFhdc5MvH99CpQBVmy6w/77r1c2H7AyvjDkXGvoNlKO4+DiIwHYv+L2kC9fxE+N2uIuFOWhLcIVelxro0LKhVEKlDLQ0yafG/euFTsyg4DGGZtvrIN768NZFo0DWlf3lrbeT3JlKIZ5Qr1FNk2o4XIYRh4aAbNlCFSJSkbXYXcnibhGI8Keg8ShSB9ofNEyvoGE9Cstq8llHAZFJpbZOCxSea9ii+ua/pj4lkHItjtHweA6klMgI4Fzy57ni4tCl0Sjlmg5NkIROfit2q/dwwDwc3vx brian@ClarkBookPro.local' }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7ezT4QbxReoas9bvsQcHTTTwrL29Hp7S+2HdeWnYpiz+NNvDCdCFAQmroLfGevuMLgdlsBIqzE+SqePXIvH8J37EGsGD472yORmN7n+DaO6FX0xZzkY4a9d5weFsz/fmIPq0SUgdx4SmGDmrP++EMU0WplLOHAac9d0NTTdJiUjWzBD0xt4Wt4+cjhJKoNGX7LCo0c/bdtbc3sk3ZFeDj/6CXrztU5ScmL5dBT1l8CUdFWV6bnXM5hOHIOnqRhAr7QhOrzKo+c4+TKnA66B2nrs+OrwucaaOpOGUsRgVifyeWowLhH/ns8fcRF5PFjOT5QfIeyR6WHgpvDJWnY8Cl brian@ClarkBookPro.local' }
  it { should have_login_shell '/bin/bash' }
  it { should have_home_directory '/home/user1' }
end

describe user('user2') do
  it { should belong_to_primary_group 'user2group' }
  it { should belong_to_group 'users' }
  it { should have_login_shell '/bin/bash' }
  it { should have_home_directory '/home/user2' }
end

describe user('developer1') do
  it { should belong_to_primary_group 'developer1' }
  it { should belong_to_group 'users' }
  it { should belong_to_group 'developers' }
  it { should have_login_shell '/bin/bash' }
  it { should have_home_directory '/dev/null' }
end

describe user('developer2') do
  it { should belong_to_primary_group 'developer2' }
  it { should_not belong_to_group 'users' }
  it { should belong_to_group 'developers' }
  it { should have_login_shell '/bin/false' }
  it { should have_home_directory '/opt/developer2' }
end

describe user('badguy') do
  it { should_not exist }
end
