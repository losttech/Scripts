param ([Parameter(Mandatory=$true)] $Name)

git clone https://github.com/losttech/Templates.ClassLib.git "$Name"
cd "$Name"
git remote rename origin template
git branch --unset-upstream
Move-Item ClassLib.sln "$Name.sln"
Move-Item src/ClassLib.csproj "src/$Name.csproj"
Move-Item test/ClassLib.Tests.csproj "test/$Name.Tests.csproj"

function Replace-InFile($path, $what, $with){
    $content = Get-Content "$path" -Raw
    $updated = $content -replace $what,$with
    Set-Content -Path "$path" $updated
}

Replace-InFile "$Name.sln" "ClassLib" "$Name"
Replace-InFile "test/$Name.Tests.csproj" "ClassLib" "$Name"
