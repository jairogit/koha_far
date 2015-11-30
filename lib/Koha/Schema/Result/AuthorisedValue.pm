use utf8;
package Koha::Schema::Result::AuthorisedValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Koha::Schema::Result::AuthorisedValue

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<authorised_values>

=cut

__PACKAGE__->table("authorised_values");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 32

=head2 authorised_value

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 lib

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 lib_opac

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 imageurl

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 32 },
  "authorised_value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "lib",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "lib_opac",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "imageurl",
  { data_type => "varchar", is_nullable => 1, size => 200 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 authorised_values_branches

Type: has_many

Related object: L<Koha::Schema::Result::AuthorisedValuesBranch>

=cut

__PACKAGE__->has_many(
  "authorised_values_branches",
  "Koha::Schema::Result::AuthorisedValuesBranch",
  { "foreign.av_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 items_search_fields

Type: has_many

Related object: L<Koha::Schema::Result::ItemsSearchField>

=cut

__PACKAGE__->has_many(
  "items_search_fields",
  "Koha::Schema::Result::ItemsSearchField",
  { "foreign.authorised_values_category" => "self.category" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2015-09-21 14:39:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rstzr/ViH5Mxzbu0fMF8pg
# These lines were loaded from '/home/liz/koha-src/koha/Koha/Schema/Result/AuthorisedValue.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package Koha::Schema::Result::AuthorisedValue;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Koha::Schema::Result::AuthorisedValue

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<authorised_values>

=cut

__PACKAGE__->table("authorised_values");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 category

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 16

=head2 authorised_value

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 80

=head2 lib

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 lib_opac

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=head2 imageurl

  data_type: 'varchar'
  is_nullable: 1
  size: 200

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "category",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 16 },
  "authorised_value",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 80 },
  "lib",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "lib_opac",
  { data_type => "varchar", is_nullable => 1, size => 200 },
  "imageurl",
  { data_type => "varchar", is_nullable => 1, size => 200 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 authorised_values_branches

Type: has_many

Related object: L<Koha::Schema::Result::AuthorisedValuesBranch>

=cut

__PACKAGE__->has_many(
  "authorised_values_branches",
  "Koha::Schema::Result::AuthorisedValuesBranch",
  { "foreign.av_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07025 @ 2013-10-14 20:56:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:N6Q7Y4sHL03X170zJ3APUA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
# End of lines loaded from '/home/liz/koha-src/koha/Koha/Schema/Result/AuthorisedValue.pm' 


# You can replace this text with custom content, and it will be preserved on regeneration
1;
