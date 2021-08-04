function ignorehistory --on-event fish_prompt
    history --delete --exact --case-sensitive fg
end
