import subprocess
import sys


class DBTRunner:
    def __init__(self, project_dir, profiles_dir=None):
        self.project_dir = project_dir
        self.profiles_dir = profiles_dir

    def run_dbt_command(self, command):
        """Run a dbt command and return the output."""
        cmd = ['dbt'] + command.split()

        # Add profiles_dir if it is set
        if self.profiles_dir:
            cmd += ['--profiles-dir', self.profiles_dir]

        print(cmd)

        try:
            result = subprocess.run(
                cmd,
                cwd=self.project_dir,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                check=True
            )
            return result.stdout
        except subprocess.CalledProcessError as e:
            print(f"Error executing dbt command: {e}")
            print(f"Error message: {e.stderr}")
            return None


# Example usage
if __name__ == "__main__":
    project_dir = "/dbt-postgres-etl/ELT/dbt"
    profiles_dir = "/dbt-postgres-etl/ELT/dbt"  # Optional, only if profiles are stored outside the default location

    dbt_runner = DBTRunner(project_dir, profiles_dir)

    # Example command: dbt run
    result = dbt_runner.run_dbt_command(' '.join(sys.argv[2:]))
    if result:
        print(result)

