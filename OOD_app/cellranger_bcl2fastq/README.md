# Example App with Jobs

![GitHub Release](https://img.shields.io/github/release/osc/ood-example-batch.svg)
[![GitHub License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

This app is meant as an example [Ruby on Rails] app that runs in an [OnDemand]
portal and uses the local cluster's resource manager for managing jobs. Feel
free to modify it anyway you see fit.

## Deploy

The directions below require Ruby and Bundler be installed and accessible from
the command line. If using a machine that has [Software Collections] you may
want to run the following command beforehand:

```console
$ source scl_source rh-ruby22 nodejs010 git19
```

Feel free to replace `rh-ruby22` and the other collections with whatever
packages your site uses through Software Collections.

1. To deploy and run this app you will need to first go to your OnDemand
   sandbox directory (if it doesn't exist, then we create it):

   ```console
   $ mkdir -p ~/ondemand/dev
   $ cd ~/ondemand/dev
   ```

2. Then clone down this app and `cd` into it:

   ```console
   $ git clone git@github.com:OSC/ood-example-foo.git foo_app
   Cloning into 'foo_app'...
   $ cd foo_app
   ```

3. Setup the app which includes downloading gem dependencies and building the
   database:

   ```console
   $ bin/setup
   == Installing dependencies ==
   ...
   ```

4. Now you should be able to access this app from OSC OnDemand at
   https://ondemand.osc.edu/pun/dev/foo_app/

   Note: You may need to replace the domain above with your center's OnDemand
   portal location if not using OSC.

## Development

This app supposedly handles most of the boilerplate code for you. So you will
only need to edit the files related to your domain science and its views.

### Configuration

All configuration is defined under `config/configuration_singleton.rb`.
Although you will most likely want to override defaults using environment
variables which you can specify in a `.env.local` file located in the root of
the app.

An example where we change the name of the batch script file that gets
submitted to the scheduler (create `.env.local` and edit it as such):

```shell
SCRIPT_NAME="new_main.sh"
```

After restarting the app it will try to submit the file rendered under
`template/new_main.sh` or `template/new_main.sh.erb` (see below).

### Job Template

Here we will edit the batch script that is run in the submitted job. You can
edit it under `template/main.sh.erb`, where we use [ERB] as our templating
system to embed Ruby code.

Typically, any parameters you expect the user to input through the web app
should show up here as:

```erb
echo <%= param1 %>
echo <%= param2 %>
```

So that when the job script is generated these will be replaced with the user's
input.

*Note, you want the batch script file name to match (without the `.erb`
extension) what you specified in the configuration file `config/ondemand.yml`.*

### Model

Next we add these parameters specified in our job template to the model located
at `app/models/job.rb`. You will add these as **custom parameters** as such:

```ruby
store_accessor :job_params, :param1
store_accessor :job_params, :param2
store_accessor :job_params, :param3
```

where you replace `param1`, `param2`, ... above with the parameter names you
chose in the template batch script.

*Optionally*, you can add [Active Record Validations] to validate any user
input, such as:

```ruby
validates :param1, :param2, presence: true
validates :param1, numericality: { only_integer: true }
```

You will also want to set the cluster that the job will be submitted to:

```ruby
def set_defaults
  self.cluster_id ||= "owens"
end
```

Where the cluster name corresponds to a cluster defined in the OnDemand cluster
configuration files located at `/etc/ood/config/clusters.d/`.

### Controller

This defines how you want the user to use your app. Currently the following
user controller actions are defined as:

- `GET /jobs` => `JobsController#index`

   List all jobs no matter their status.

- `GET /jobs/:id` => `JobsController#show`

   Show the details for a given job.

- `GET /jobs/new` => `JobsController#new`

   This is the form used to create a new job.

- `POST /jobs` => `JobsController#create`

   This is where the form used to create a new job is posted to. After a new
   job is created, the user is redirected to the details view of this job.

- `GET /jobs/:id/edit` => `JobsController#edit`

   This is the form used to update a given job's parameters.

- `PATCH /jobs/:id` => `JobsController#update`

   This is where the form used to update a given job is sent to. After the job
   is updated, the user is redirected to the details view of this job.

- `PATCH /jobs/:id/stage` => `JobsController#stage`

   Visiting this path will stage the job's template underneath a unique
   directory in the app's data root with the user's parameters filled in. After
   staging, the user is redirected back to the list page.

- `PATCH /jobs/:id/submit` => `JobsController#submit`

   Visiting this path will submit a staged job to the resource manager. After
   submitting, the user is redirected back to the list page.

- `PATCH /jobs/:id/stop` => `JobsController#stop`

   Visiting this path will stop a job that is submitted to the resource
   manager. After stopping, the user is redirected to the list page.

- `DELETE /jobs/1` => `JobsController#destroy`

   Visiting this path will stop a submitted job, remove the staged directory,
   and delete the record of the job from the database. After destroying the
   job, the user is redirected back to the list page.

Feel free to remove actions or modify current ones. Examples being:

- Remove access to update a job's parameters (delete the `JobsController#edit`
  and `JobsController#update`).
- Remove access to staging a job, and directly stage a job when a new job is
  created or just before a job is submitted (delete the `JobsController#stage`
  and move the `StageTemplate` call to either `JobsController#create` or
  `JobsController#submit`).
- Remove updating, staging, and submitting. So when a user creates a new job it
  immediately stages and submits the corresponding job.

Note that you may also want to delete the corresponding routes in
`config/routes.rb` if you remove a controller action.

Finally, you will want to update the views so that they don't link to an
invalid route and action.

### Views

You can find and edit any of the views under `app/views/jobs/*`. When adding or
removing job parameters be sure to also edit them under:

- `app/views/jobs/index.html.erb`
- `app/views/jobs/show.html.erb`
- `app/views/jobs/_form.html.erb`

Note that you may not need all of these views. For example you may not need a
`show.html.erb` view if the user will just view results in the File Explorer.

[Ruby on Rails]: https://rubyonrails.org/
[OnDemand]: http://openondemand.org/
[Software Collections]: https://www.softwarecollections.org/en/
[ERB]: https://en.wikipedia.org/wiki/ERuby
[Active Record Validations]: http://guides.rubyonrails.org/v4.2/active_record_validations.html

----
scl enable rh-ruby22 nodejs010 git19 bash
bundle install (this step installs 85 MB stuffs, avoid this. the above step is good)
bin/rake assets:clobber
bin/rake assets:precompile
which will create public/assets dir which you have to copy over to /var/www/ood/apps/sys/nameofapp/public , change ownership to root
make sure to delete any previous copy of ~/ondemand/data/sys/example-batch/production.sqlite3

if app does not deploy in sys production mode. 
try to run bin/setup and bin/setup-production
----
