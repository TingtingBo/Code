% fn = bet_i1 + bet_i2 * age + bet_i3 * max(0, age - bet_i4);
% bet_i1 = ac0 + u1 ;	/* Intercept */
% bet_i2 = ac1 + u2 ;	/* 1st slope */
% bet_i3 = dc1 + u3 ;	/* Slope differences */
% bet_i4 = tau + u4 ;	/* Transition point  */
% 

figure
%asd norm

bet_i1 = 35.3947 +1.352;
bet_i2 = 1.5382 +.001221;
bet_i3 = -1.4156 + -.00099;
bet_i4 = 7.5181 +.05004;
ageasdnorm = preagearray(asdnorm,:);
asdnormout = bet_i1 + (bet_i2 * ageasdnorm) + bet_i3 * max(0, ageasdnorm - bet_i4);
ageasdndm2 = ageasdnorm(:);
asdnormout2 = asdnormout(:);
[b,iasdnorm] = sort(ageasdndm2);
plot(ageasdndm2(iasdnorm), asdnormout2(iasdnorm), 'g','LineWidth',4)
hold on

%norm
bet_i1 = 35.246 +.7786;
bet_i2 = 1.453 +.000556;
bet_i3 = -1.3197 + -.00016;
bet_i4 = 7.4921 +.08818;
agenorm = preagearray(norm,:);
normout = bet_i1 + (bet_i2 * agenorm) + bet_i3 * max(0, agenorm - bet_i4);
agenorm2 = agenorm(:);
normout2 = normout(:);
[b,inorm] = sort(agenorm2);
plot(agenorm2(inorm), normout2(inorm), 'b' ,'LineWidth',4)

%asd dm
bet_i1 = 36.9695 +2.2089;
bet_i2 = 1.4095 +.1486;
bet_i3 = -1.1703 + -.01609;
bet_i4 = 9.0368 +.1599;
ageasddm = preagearray(asddm,:);
asddmout = bet_i1 + (bet_i2 * ageasddm) + bet_i3 * max(0, ageasddm - bet_i4);
ageasddm2 = ageasddm(:);
asddmout2 = asddmout(:);
[b,iasddm] = sort(ageasddm2);
plot(ageasddm2(iasddm),asddmout2(iasddm), 'r','LineWidth',4)



plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'MarkerSize',3) %plot the asddm group

hold on
plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','r',...
                'MarkerSize',3)
plot(preagearray(norm,:)', prehxarray(norm,:)', 'bo','LineWidth',1,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b',...
                'MarkerSize',3)

%%%%% Group comparison figures

%%%%%ASD DM vs. TD
figure
%asddm

bet_i1 = 35.1557 +1.3253;
bet_i2 = 1.4918  + 0.005004;
bet_i3 = -1.3596;
bet_i4 = 7.3659  +0.4146;
ageasddm = preagearray(asddm,:);
asddmout = bet_i1 + (bet_i2 * ageasddm) + bet_i3 * max(0, ageasddm - bet_i4);
ageasddm2 = ageasddm(:);
asddmout2 = asddmout(:);
[b,iasddm] = sort(ageasddm2);
plot(ageasddm2(iasddm), asddmout2(iasddm), 'r','LineWidth',4)
hold on

%norm
bet_i1 = 35.1557;
bet_i2 = 1.4918;
bet_i3 = -1.3596;
bet_i4 = 7.3659;
agenorm = preagearray(norm,:);
normout = bet_i1 + (bet_i2 * agenorm) + bet_i3 * max(0, agenorm - bet_i4);
agenorm2 = agenorm(:);
normout2 = normout(:);
[b,inorm] = sort(agenorm2);
plot(agenorm2(inorm), normout2(inorm), 'b' ,'LineWidth',4)

plot(preagearray(norm,:)',prehxarray(norm,:)', 'go','LineWidth',1,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b',...
                'MarkerSize',3) %plot the asddm group

hold on
plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','r',...
                'MarkerSize',3)
%%%%% ASD Norm vs. ASD DM            
 figure
%asddm

bet_i1 = 35.3757  +0.9538;
bet_i2 = 1.5473 +0.01204;
bet_i3 = -1.4248;
bet_i4 = 7.4856 +0.06841;
ageasddm = preagearray(asddm,:);
asddmout = bet_i1 + (bet_i2 * ageasddm) + bet_i3 * max(0, ageasddm - bet_i4);
ageasddm2 = ageasddm(:);
asddmout2 = asddmout(:);
[b,iasddm] = sort(ageasddm2);
plot(ageasddm2(iasddm), asddmout2(iasddm), 'r','LineWidth',4)
hold on

%norm
bet_i1 = 35.3757;
bet_i2 = 1.5473;
bet_i3 = -1.4248;
bet_i4 = 7.4856;
ageasdnorm = preagearray(asdnorm,:);
asdnormout = bet_i1 + (bet_i2 * ageasdnorm) + bet_i3 * max(0, ageasdnorm - bet_i4);
ageasdnorm2 = ageasdnorm(:);
asdnormout2 = asdnormout(:);
[b,iasdnorm] = sort(ageasdnorm2);
plot(ageasdnorm2(iasdnorm), asdnormout2(iasdnorm), 'g' ,'LineWidth',4)

plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'MarkerSize',3) %plot the asddm group

hold on
plot(preagearray(asddm,:)',prehxarray(asddm,:)', 'ro','LineWidth',1,...
                'MarkerEdgeColor','r',...
                'MarkerFaceColor','r',...
                'MarkerSize',3)      
            
        %%%%% ASD Norm vs. TD            
 figure
%norm
bet_i1 = 35.0982;
bet_i2 = 1.5132;
bet_i3 = -1.3800;
bet_i4 = 7.2848;
agenorm = preagearray(norm,:);
normout = bet_i1 + (bet_i2 * agenorm) + bet_i3 * max(0, agenorm - bet_i4);
agenorm2 = agenorm(:);
normout2 = normout(:);
[b,inorm] = sort(agenorm2);
plot(agenorm2(inorm), normout2(inorm), 'b' ,'LineWidth',4)
hold on
%ASDnorm
bet_i1 = 35.0982 +0.3765;
bet_i2 = 1.5132 + -0.00975;
bet_i3 = -1.3800;
bet_i4 = 7.2848 +0.3522;
ageasdnorm = preagearray(asdnorm,:);
asdnormout = bet_i1 + (bet_i2 * ageasdnorm) + bet_i3 * max(0, ageasdnorm - bet_i4);
ageasdnorm2 = ageasdnorm(:);
asdnormout2 = asdnormout(:);
[b,iasdnorm] = sort(ageasdnorm2);
plot(ageasdnorm2(iasdnorm), asdnormout2(iasdnorm), 'g' ,'LineWidth',4)

plot(preagearray(asdnorm,:)',prehxarray(asdnorm,:)', 'go','LineWidth',1,...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'MarkerSize',3) %plot the asddm group

hold on
plot(preagearray(norm,:)',prehxarray(norm,:)', 'ro','LineWidth',1,...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b',...
                'MarkerSize',3)    
            
            %% how to add a title and stuff
title('Head circumference by group', 'FontSize', 20);
xlabel('Age (months)', 'FontSize', 16);
ylabel('Head circumference (cm)', 'FontSize', 16);

