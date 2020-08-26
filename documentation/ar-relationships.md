# database table relationships
Some relationships, including the one-to-one relationship between a question and a selected answer are not represented in the ActiveRecord DSL since the relationship is not necessary for the intented SQL queries being made.

## Person

```ruby
has_many :questions
has_many :answers
has_many :answer_ratings
has_many :course_rosters
has_many :courses, through: :course_rosters
```

## Course

```ruby
has_many :course_rosters
has_many :people, through: :course_roster
has_many :questions
belongs_to :person
```

## CourseRoster

```ruby
belongs_to :person
belongs_to :course
```

## Question

```ruby
belongs_to :person
belongs_to :course
has_many :answers
```

## Answer

```ruby
belongs_to :question
belongs_to :person
has_many :answer_ratings
```

## AnswerRating

```ruby
belongs_to :answer
belongs_to :person
```
