# Benchmarking of database approaches

This project aims at comparing different approaches to database management

## The model

The benchmarking case-study is a CD collection. See dbagile/announced.yaml for a relational
model.

## Challenges

### Challenge n°1

Display the list of all performers (relatively small table), in any order. Each line should be
of the following form:

    #{id}: #{first_name} #{last_name}

### Challenge n°2

Display the list of all tracks (relatively big table), in any order. Each line should be
of the following form:

    #{id}: #{title}

### Challenge n°3

Display the title of each album, together with the name of the performer. Each line should be
of the following form:

    #{title}: #{first_name} #{last_name}

### Challenge n°4

Display the title of each album, together with the number of tracks. Each line should be
of the following form:

    #{title}: #{tracks_count}

## Active record

The active records benchmarks have been built according information found on the following websites:

* http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations
* http://snippets.dzone.com/posts/show/3097
* https://github.com/cesario/no_querying_views
* http://blog.joyofthink.com/yangchen/blog1.php/2010/06/14/activerecord-without-rails
* http://blog.aizatto.com/2007/05/21/activerecord-without-rails/