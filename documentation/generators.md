# Rails generators

## Person

```bash
rails g model Person email:string password_digest:string first_name:string last_name:string summary:text
rails g controller api/v1/people
```

## Auth
```bash
rails g controller api/v1/auth
```

## Registration
```bash
rails g controller api/v1/registration
```

## Course

```bash
rails g model Course title:string description:text start_date:date end_date:date archived:boolean person:references{index}
rails g controller Courses
```

## CourseRoster

```bash
rails g model CourseRoster moderator:boolean person:belongs_to{index} course:belongs_to{index}
```

## Question

```bash
rails g model Question title:string description:text person:belongs_to{index} course:belongs_to{index} selected_answer_id:integer
```

## Answer

```bash
rails g model Answer text:text person:belongs_to{index} question:belongs_to{index}
```

## AnswerRating

```bash
rails g model AnswerRating person:belongs_to{index} answer:belongs_to{index}
```
