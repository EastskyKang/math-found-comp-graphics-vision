function VisCompSigma( x_range, y_range, F, sigma, xi, yi, nix, niy, threshold, ...
        datacurve_YN, normalvector_YN, fittedcurve_YN )
    %VisCompSigma
    
    % c0 (implicit surface)
    imagesc(x_range, y_range, F)
    axis xy
    title(['sigma = ', num2str(sigma)])
    xlabel('x')
    ylabel('y')
    colorbar
    hold on
    
    if fittedcurve_YN
        % fitted curve
        [idx_y, idx_x] = find(abs(F) < threshold);
        
        x_f = x_range(idx_x);
        y_f = y_range(idx_y);
        
        plot(x_f, y_f, 'g.')
    end
     
    % data
    if datacurve_YN
        % curve
        plot(xi, yi, 'r.')
    end
    
    if normalvector_YN
        % normal vectors
        quiver(xi, yi, nix, niy)
    end
    
    hold off
    axis equal
    xlim([x_range(1), x_range(end)])
    ylim([y_range(1), y_range(end)])
end

