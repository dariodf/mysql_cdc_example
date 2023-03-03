defmodule MyApp.Pipeline do
  use Broadway

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: Maxwell,
      producer: [
        module: {BroadwayRabbitMQ.Producer,
          connection: [
            username: "guest",
            password: "guest"
          ],
          declare: [durable: false],
          queue: "my_queue",
          bindings: [{"maxwell", []}],
          on_failure: :reject_and_requeue
        },
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 1
        ]
      ]
    )
  end

  @impl true
  def handle_message(:default, %Broadway.Message{data: data} = message, _context) do
    Jason.decode!(data)
    |> IO.inspect()

    message
  end
end
