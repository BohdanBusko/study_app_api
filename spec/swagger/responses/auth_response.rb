module SwaggerResponses
  def auth_response
    {
      token: 'eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7InVzZXJfaWQiOjF9fQ.2MsjQvcIt3wDxROaQN21aMFNgtdYZCYCpJrlNwmYkcc',
      user: {
        data: {
          id: 1,
          type: 'user',
          attribute: {
            first_name: 'John',
            last_name: 'Doe',
            full_name: 'John Doe'
          }
        }
      }
    }
  end
end
