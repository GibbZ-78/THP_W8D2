# THP W7D3..5 - EventHack v.20 - Cracking global event organization (again...)

## :one: Content

Here below are some of the stuff you may want to cover while browsing this Ruby on Rail (RoR) project :

* Migrations, schema, data models, seeds and more - See _/db/_

* Corresponding models and relations - See _/app/models/_ and the data model pictured below mixing MCD, MLD and MPD

* Configuration (incl. 'routes.rb', 'database.yml' initialized for PostegreSQL...) - See related files in the _/config/_ directory

* Controllers - See _/app/controllers/_

* Views and layouts - See _/app/views/_ sub-directories. In particular, _/app/views/layouts/_ gathers the header / footer templating and _/devise/_ stores all 'devise' gem related pages and helpers

* Regarding today's (March 1st, 2022) expected deliverables, you should be able to:
  * browse the EventHack 2.0 site and see how a [dedicated BootSwatch theme named VAPOR](https://bootswatch.com/vapor/) was applied to the entire front pages
  * navigate the "UI Kit Demo" menu (above in the navigation bar) to switch between VAPOR, the standard BOOTSTRAP library and my ugly handmade UI Kit. All the latters deployed on examplary atoms and molecules (headings, texts, buttons...)

## :two: Data Models

![EventHack data model 1/2 (JPEG)](db/MCD.png?raw=true "EventHack conceptual data model")

![EventHack data model 2/2 (JPEG)](db/MLD.png?raw=true "EventHack logical data model")

## :three: How to

To be able to download and use this project under your own unix-like OS, simply follow the white rabbit :rabbit2: by :
1. Cloning the current repository into an empty local directory
2. From this local directory, loading all required GEMS and renewing the _Gemfile.lock_ by entering ```bundle install```
3. Generating both DEV and TEST databases, typing ```rails db:create``` _(you need to have PostgreSQL installed and running first, btw :wink:)_
4. Creating all needed tables, via a quick ```rails db:migrate```, then feeding them thanks to a smooth ```rails db:seed```
5. Launching the packaged Puma web server on default port #3000 (if not already the case, of course), entering ```rails s(erver)```
6. Opening your favorite web browser and typing ```localhost:3000``` in the search / URL bar
7. Browsing the site when not connected or using one of the following registered accounts:
   - gibbz01@yopmail.com / THP_2022 [User + Promoter + Admin rights (partially coded | WIP)]
   - gibbz02@yopmail.com / THP_2022 [User + Promoter]
   - gibbz03@yopmail.com / THP_2022 [User + Promoter]

## :four: Credits
&copy; 2022 - Jean-Baptiste VIDAL ([Github repo](https://github.com/GibbZ-78))

Enjoy, _wanderer_ :wink: !  