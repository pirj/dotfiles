export const NotificationPlugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      // Send notification when session becomes idle (task completed)
      if (event.type === "session.idle") {
        await $`osascript -e 'display notification "Done" with title "opencode"'`
      }
    },
  }
}
